# Some xPath queries

## Find specific user logon
```xml
<QueryList>
  <Query Id="0" Path="Security">
    <Select Path="Security">
      *[System[(Level=4 or Level=0) and (EventID=4624 or EventID=4634)]] and 
      *[EventData[Data[@Name='TargetUserName']='<UserName>']]
    </Select>
  </Query>
</QueryList>
```
## Find all RDP logons
```xml
<QueryList>
  <Query Id="0" Path="Security">
    <Select Path="Security">
      *[System[(Level=4 or Level=0) and (EventID=4624 or EventID=4634)]] and 
      *[EventData[Data[@Name='LogonType']='10']] and (*[EventData[Data[5]='10']] or 
      *[EventData[Data[@Name='AuthenticationPackageName']='Negotiate']])
    </Select>
  </Query>
</QueryList>
```
