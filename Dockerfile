FROM debian

WORKDIR /tmp/

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y dotnet-sdk-6.0

COPY . /app/

WORKDIR /app/

ENTRYPOINT ["dotnet", "run", "--urls", "http://0.0.0.0:8080"]
