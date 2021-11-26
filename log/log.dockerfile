FROM python:3.9-slim
#標楷體
ADD ./kaiu.ttf /usr/share/fonts/
#思源楷體
#ADD ./TW-Kai-98_1.ttf /usr/share/fonts/
RUN apt-get update && apt-get install -y fontconfig
RUN fc-cache -f -v 

RUN apt-get update && apt-get install -y wget
RUN apt-get update && apt-get install -y libreoffice-writer --no-install-recommends
RUN apt-get update && apt-get install -y default-jre
RUN wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb 

#PDF無法顯示文字 並不是編碼的問題 是沒有相對字型造成的
#RUN apt-get update && apt-get install -y locales
#RUN locale-gen zh_TW.UTF-8 
#ENV LANG zh_TW.UTF-8 
#ENV LANGUAGE zh_TW.UTF-8 
#ENV LC_ALL zh_TW.UTF-8 

#時區需要額外設定才能成功顯示正確時間
ENV TZ=Asia/Taipei

ADD ./requirements.txt /
RUN pip install -r ./requirements.txt
WORKDIR /app
ADD ./data/log.py /app/
ADD ./data/機房工作日誌.docx /app/

CMD [ "python","log.py" ]