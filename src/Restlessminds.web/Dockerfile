FROM microsoft/aspnetcore:1.1
ENTRYPOINT ["dotnet", "Restlessminds.web.dll"]
ARG source=.
WORKDIR /app
EXPOSE 80
COPY $source .
