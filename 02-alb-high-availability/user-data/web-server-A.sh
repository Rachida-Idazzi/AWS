#!/bin/bash
# Update packages and install Apache
dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd

# Create the HTML file
cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AWS Infrastructure | Online</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body, html {
            height: 100%;
            background-color: #ffffff;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            text-align: center;
            max-width: 600px;
            padding: 40px;
            border: 1px solid #eaeaea; 
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03);
        }
        .accent-line {
            width: 60px;
            height: 4px;
            background-color: #FF9900; /* AWS Orange */
            margin: 0 auto 30px auto;
            border-radius: 2px;
        }
        h1 {
            color: #232F3E; /* AWS Squid Ink */
            font-size: 2.2rem;
            font-weight: 500;
            margin-bottom: 15px;
            letter-spacing: -0.5px;
        }
        p {
            color: #545b64;
            font-size: 1.1rem;
            line-height: 1.6;
            font-weight: 300;
        }
        .highlight {
            font-weight: bold;
            color: #FF9900;
            margin-top: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="accent-line"></div>
        <h1>Infrastructure is Online</h1>
        <p>Welcome to the Public Web Server. The AWS VPC, Route Tables, and Security Groups are configured successfully.</p>
        <p class="highlight">Server 1A (eu-west-2a)</p>
    </div>
</body>
</html>
EOF
