from flask import Flask, request
import random

app = Flask(__name__)

@app.route('/')
def index():
    # 사용자 입력을 받는 HTML 폼 반환
    return '''
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>로또 번호 추첨</title>
        <style>
            body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f0f2f5; }
            .container { background-color: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center; width: 300px; }
            h1 { color: #333; font-size: 24px; margin-bottom: 20px; }
            input { width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
            button { width: 100%; padding: 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; }
            button:hover { background-color: #0056b3; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>이름을 입력하세요</h1>
            <form action="/lotto" method="get">
                <input type="text" name="username" placeholder="이름" required>
                <button type="submit">번호 받기</button>
            </form>
        </div>
    </body>
    </html>
    '''

@app.route('/lotto')
def lotto():
    # URL 파라미터에서 이름 가져오기
    username = request.args.get('username', '사용자')
    # 1~45 사이의 숫자 중 중복 없이 6개 추출 후 정렬
    lotto_nums = sorted(random.sample(range(1, 46), 6))
    
    return f'''
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <style>
            body {{ font-family: 'Arial', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f0f2f5; }}
            .container {{ background-color: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center; width: 300px; }}
            h1 {{ color: #333; font-size: 20px; margin-bottom: 20px; }}
            h2 {{ color: #007bff; letter-spacing: 2px; margin: 20px 0; }}
            a {{ text-decoration: none; color: #666; font-size: 14px; }}
            a:hover {{ text-decoration: underline; }}
        </style>
    </head>
    <body>
        <div class="container">
            <h1>{username}님을 위한 로또 추천 번호입니다!</h1>
            <h2>{lotto_nums}</h2>
            <a href="/">다시 하기</a>
        </div>
    </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(debug=True, port=8000)