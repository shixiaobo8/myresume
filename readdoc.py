#!/usr/bin/env python3
# -*- coding:utf8 -*-
from flask import Flask,render_template

app = Flask(__name__)

@app.route('/')
def hello_world():
    #path = "/www/web/myresume/linux_shiyiguo.html"
    #contents = subprocess.getstatusoutput("cat "+path)
    #print(contents[1].encode('utf8'))
    #return contents[1].encode('utf-8')
    return render_template("linux_shiyiguo.html")


if __name__=='__main__':
    app.run(host='0.0.0.0',port='8002',debug=True)
