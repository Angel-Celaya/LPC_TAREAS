#!/usr/bin/env python3


email = $1

mensaje = $1
function py {python3 -c "$1" "$2";}
for email in $(cat $email)

do


    py "
    from email.mime.multipart import MIMEMultipart
    from email.mime.text import MIMEText
    import smtplib
    import json


    data = {}
    with open("pass.json") as f:
        data = json.load(f)

    email_msg = MIMEMultipart()
    email_msg["From"] = data["user"]
    receipents = ["angelcelaya57@gmail.com"]
    email_msg["To"] = ", ".join(receipents)
    email_msg["Subject"] = "Tarea"

    message = "Este es el cuerpo de la tarea"
    email_msg.attach(MIMEText(message, "plain"))

    server = smtplib.SMTP("smtp.office365.com:587")
    server.starttls()
    server.login(data["user"], data["pass"])


    server.sendmail(email_msg["From"], receipents, email_msg.as_string())
    server.quit()
    print("El email se envio correctamente %s:" % (email_msg["To"]))
