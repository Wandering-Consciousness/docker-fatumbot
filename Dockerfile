FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /fatumbot
	
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY VFatumbot/ .
RUN dotnet restore "VFatumbot.csproj"
RUN dotnet publish "VFatumbot.csproj" -c ReleaseProd -o /fatumbot

#FROM build AS publish
#RUN dotnet publish "VFatumbot.csproj" -c ReleaseProd -o /fatumbot

#FROM base AS final
WORKDIR /fatumbot
#COPY --from=publish /fatumbot .
COPY libAttract.a .
COPY libAttract.a.0.96.1 .
COPY libAttract.so .
COPY libAttract.so.0.96.1 .
COPY google_play_developer_api_credentials.json .

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \ 
	&& apt update \
	&& apt install -y nodejs

WORKDIR /directline
COPY offline-directline .
RUN npm install
RUN npm run build

WORKDIR /
COPY init.sh .
RUN ["chmod", "+x", "/init.sh"]

ENTRYPOINT ["/init.sh"]
