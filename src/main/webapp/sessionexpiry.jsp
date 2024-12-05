<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session Expired</title>
    <style>
        /* Styles for Session Expired Page */
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(90deg, #000044 0%, #000 100%);
            color: #333;
        }

        .container {
            text-align: center;
            background-color: #3f4e5a;
            padding: 2rem 3rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5rem;
            color: var(--text-light);
            margin-bottom: 1rem;
            background: linear-gradient(135deg, #84e1e1 0%, #80dfff 100%);
		    -webkit-background-clip: text;
		    -webkit-text-fill-color: transparent;
        }

        p {
            font-size: 1.2rem;
            color: #fff;
        }

        a {
            display: inline-block;
            margin-top: 1.5rem;
            padding: 0.6rem 1.2rem;
            color: var(--text-light);
            background: linear-gradient(135deg, #84e1e1 0%, #80dfff 100%);
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #e65c6b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>OOPS...!!!</h1>
        <p>Session Expired</p>
        <a href="login">Login Again</a>
    </div>
</body>
</html>
