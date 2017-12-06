/// This sample persistent class represents an employee.<br>
Class Sample.Employee Extends Person
{

/// The employee's job title.
Property Title As %String(MAXLEN = 50, POPSPEC = "Title()");

/// The employee's current salary.
Property Salary As %Integer(MAXVAL = 100000, MINVAL = 0);

/// A character stream containing notes about this employee.
Property Notes As %Stream.GlobalCharacter;

/// A picture of the employee
Property Picture As %Stream.GlobalBinary;

/// The company this employee works for.
Relationship Company As Company [ Cardinality = one, Inverse = Employees ];

/// This method overrides the method in <class>Person</class>.<br>
/// Prints the properties <property>Name</property> and <property>Title</property> 
/// to the console.
Method PrintPerson()
{
	Write !,"Name: ", ..Name, ?30, "Title: ", ..Title
	Quit
}

/// writes a .png file containing the picture, if any, of this employee
/// the purpose of this method is to prove that Picture really contains an image
Method WritePicture()
{
	if (..Picture="") {quit}
	set name=$TR(..Name,".") ; strip off trailing period
	set name=$TR(name,", ","__") ; replace commas and spaces
	set filename=name_".png"
	
	set file=##class(%Stream.FileBinary).%New()
	set file.Filename=filename
	do file.CopyFrom(..Picture)
	do file.%Save()
	write !, "Generated file: "_filename
}

Storage Default
{
<Data name="EmployeeDefaultData">
<Subscript>"Employee"</Subscript>
<Value name="1">
<Value>Company</Value>
</Value>
<Value name="2">
<Value>Notes</Value>
</Value>
<Value name="3">
<Value>Salary</Value>
</Value>
<Value name="4">
<Value>Title</Value>
</Value>
<Value name="5">
<Value>Picture</Value>
</Value>
</Data>
<DefaultData>EmployeeDefaultData</DefaultData>
<ExtentSize>100</ExtentSize>
<Property name="%%CLASSNAME">
<AverageFieldSize>17</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Age">
<AverageFieldSize>1.87</AverageFieldSize>
<Selectivity>1.6393%</Selectivity>
</Property>
<Property name="Company">
<AverageFieldSize>1.56</AverageFieldSize>
<Selectivity>5.2632%</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="FavoriteColors">
<AverageFieldSize>7.96</AverageFieldSize>
<OutlierSelectivity>.29:</OutlierSelectivity>
<Selectivity>1.7317%</Selectivity>
</Property>
<Property name="Home">
<AverageFieldSize>36.21,City:7.33,State:2,Street:16.48,Zip:5</AverageFieldSize>
<Selectivity>1.0000%,City:4.0000%,State:2.3256%,Street:1.0000%,Zip:1.0000%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>16.25</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="Notes">
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Office">
<AverageFieldSize>35.43,City:6.5,State:2,Street:16.62,Zip:5</AverageFieldSize>
<Selectivity>1.0000%,City:4.1667%,State:2.2727%,Street:1.0000%,Zip:1.0000%</Selectivity>
</Property>
<Property name="Picture">
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="SSN">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Salary">
<AverageFieldSize>4.94</AverageFieldSize>
<Selectivity>1.0000%</Selectivity>
</Property>
<Property name="Spouse">
<AverageFieldSize>1.89</AverageFieldSize>
<Selectivity>1.6129%</Selectivity>
</Property>
<Property name="Title">
<AverageFieldSize>20.24</AverageFieldSize>
<Selectivity>1.3699%</Selectivity>
</Property>
<SQLMap name="$Employee">
<BlockCount>-4</BlockCount>
</SQLMap>
<Type>%Library.CacheStorage</Type>
}

}
