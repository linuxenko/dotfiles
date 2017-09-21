#!/usr/bin/env python

import os
import re
import sys
import csv
import email
import email.header
import imaplib
import subprocess

tmpfile = os.path.join(os.environ['HOME'], ".cache/unread-mail")

args = sys.argv[1:]
nologin = False

if args[0] == '--no-login':
    args = args[1:]
    nologin = True

mailboxes = []
while args[0] == '--index':
    mailboxes.append(args[1])
    args = args[2:]

server, userid = args

with open(os.path.join(os.environ['HOME'], '.authinfo'), 'r') as fd:
    for line in fd:
        match = re.match(r'machine +(\S+) +login +(\S+) +' +
                         r'password +(\S+)( +port +([0-9]+))?', line)
        if match:
            machine, login, password, hasport, port = match.groups()
            if machine == server and userid == login:
                break

try:
#    if hasport and int(port) == 993:
        imap = imaplib.IMAP4_SSL(machine, int(port) if hasport else 993)
#    else:
#        imap = imaplib.IMAP4(machine, int(port) if hasport else 143)
except:
    print "IMAP server is not running at this time"
    sys.exit(0)                         # ignore if we can't connect

if not nologin:
    imap.login(login, password)

def index_mbox(mbox):
    imap.select(mbox)
    try:
        imap.search(None, '(TEXT "xylophone")')
    except:
        pass

# Update search indexes
map(index_mbox, mailboxes)

imap.select()                   # select the INBOX
typ, data = imap.search(None, 'UnSeen')
data = data[0].split()

past_data = []

if os.path.exists(tmpfile):
    past_data = map(lambda x: x[:-1], open(tmpfile, 'r').readlines())

msgs  = {}
count = 0
for num in data:
    query = '(BODY.PEEK[HEADER.FIELDS (MESSAGE-ID FROM SUBJECT)])'
    typ, data = imap.fetch(num, query)
    msg = email.message_from_string(data[0][1])

    name, addr = email.Utils.parseaddr(msg['From'])

    ident = msg['Message-Id']
    msgs[ident] = (msg, name, addr)

    if ident not in past_data:
        count += 1

imap.close()
imap.logout()

try:
    for msgid in msgs.keys():
        info = msgs[msgid]
        subprocess.call(['/usr/bin/notify-send', '"new mail '
            + email.header.decode_header(info[1] or info[2])[0][0]
            + "\n"
            + email.header.decode_header(info[0]['Subject'])[0][0]
            + '"'])
except:
    pass

if msgs:
    with open(tmpfile, 'w') as fd:
        for msgid in msgs.keys():
            fd.write(str(msgid))
            fd.write('\n')

sys.exit(0)

### imap-unread ends here
