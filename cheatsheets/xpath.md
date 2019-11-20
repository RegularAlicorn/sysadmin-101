# Some xPath queries

## Find specific user logon
```xml
<QueryList>
  <Query Id="0" Path="Security">
    	<Select Path="Security">
  		*[System[(EventID=’4624′)]]
	    	and
		*[EventData[Data[@Name='TargetUserName'] and (Data='<Username>')]]
	</Select>
  </Query>
</QueryList>
```
