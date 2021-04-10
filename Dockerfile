FROM ubuntu:20.04
#tzdata was hanging
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential git ffmpeg libsm6 libxext6
RUN git clone https://github.com/tadtenacious/Sketches-web-app.git --depth 1 && cd Sketches-web-app
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
EXPOSE 8501
CMD streamlit run main.py
