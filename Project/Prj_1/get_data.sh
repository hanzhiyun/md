awk '$1=="@@@@"' dc.log | tee dc.txt
awk '$1=="@@@@"' fcc.log | tee fcc.txt
awk '$1=="@@@@"' bcc.log | tee bcc.txt
awk '$1=="@@@@"' sc.log | tee sc.txt

