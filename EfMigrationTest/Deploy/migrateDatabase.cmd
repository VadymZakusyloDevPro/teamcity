set EfMigrationsNamespace=%Data
set EfMigrationsDllName=%D:\Projects\teamcity\teamcity2\EfMigrationTest\Startup\bin\Debug\netcoreapp2.1\Data.dll
set startupAssemblyDllName=%D:\Projects\teamcity\teamcity2\EfMigrationTest\Startup\bin\Debug\netcoreapp2.1\Startup.dll
set EfMigrationsDllDepsJson=%Startup.deps.json

set DllDir=D:\Projects\teamcity\teamcity2\EfMigrationTest\Startup\bin\Debug\netcoreapp2.1
set PathToNuGetPackages=%USERPROFILE%\.nuget\packages
set PathToEfDll=C:\Users\vadym\.nuget\packages\microsoft.entityframeworkcore.tools\2.0.2\tools\netcoreapp2.0\ef.dll

dotnet exec --depsfile %EfMigrationsDllDepsJson% --additionalprobingpath %PathToNuGetPackages% %PathToEfDll% database update --assembly %EfMigrationsDllName% --startup-assembly %startupAssemblyDllName% --project-dir %DllDir% --data-dir %DllDir% --verbose --root-namespace %EfMigrationsNamespace%