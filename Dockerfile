FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base

RUN apt-get update \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq
COPY . .
RUN dotnet build
WORKDIR /DotnetTemplate.Web
RUN npm install
RUN npm run build


EXPOSE 5000
ENTRYPOINT ["dotnet run"]
# CMD dotnet run
