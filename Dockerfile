FROM mcr.microsoft.com/dotnet/runtime:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["netCoreTest.csproj", "./"]
RUN dotnet restore "netCoreTest.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "netCoreTest.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "netCoreTest.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "netCoreTest.dll"]
