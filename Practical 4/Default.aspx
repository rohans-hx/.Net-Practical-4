<%@ Page Language="C#" CodeBehind="Default.aspx.cs" Inherits="Practical_4.Default" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <title>Online Event Registration Form</title>

    <script type="text/javascript">

        function ValidateGender(source, args)
        {
            var male = document.getElementById('<%= Male.ClientID %>');
            var female = document.getElementById('<%= Female.ClientID %>');

            args.IsValid = male.checked || female.checked;
        }

        function ValidateEvent(source, args)
        {
            var paper = document.getElementById('<%= Paper.ClientID %>');
            var poster = document.getElementById('<%= Poster.ClientID %>');
            var coding = document.getElementById('<%= Coding.ClientID %>');

            args.IsValid = paper.checked || poster.checked || coding.checked;
        }

    </script>

</head>

<body>

    <form id="form1" runat="server">

        <center>

            <h2>Online Event Registration Form</h2>

            <table>

                <!-- Name -->
                <tr>

                    <td>
                        <asp:Label
                            ID="name"
                            runat="server"
                            Text="Enter Name">
                        </asp:Label>
                    </td>

                    <td>
                        <asp:TextBox
                            ID="TextBox1"
                            runat="server">
                        </asp:TextBox>
                    </td>

                    <td>
                        <asp:RequiredFieldValidator
                            ID="rfvName"
                            runat="server"
                            ControlToValidate="TextBox1"
                            ErrorMessage="Name cannot be blank"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </td>

                </tr>


                <!-- Enrollment Number -->
                <tr>

                    <td>
                        <asp:Label
                            ID="Enroll"
                            runat="server"
                            Text="Enter Enrollment No.">
                        </asp:Label>
                    </td>

                    <td>
                        <asp:TextBox
                            ID="TextBox2"
                            runat="server">
                        </asp:TextBox>
                    </td>

                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="TextBox2"
                            ErrorMessage="Please enter enrollment number"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </td>

                </tr>


                <!-- Email -->
                <tr>

                    <td>
                        <asp:Label
                            ID="mail"
                            runat="server"
                            Text="Email">
                        </asp:Label>
                    </td>

                    <td>
                        <asp:TextBox
                            ID="TextBox3"
                            runat="server">
                        </asp:TextBox>
                    </td>

                    <td>

                        <asp:RequiredFieldValidator
                            ID="rfvEmail"
                            runat="server"
                            ControlToValidate="TextBox3"
                            ErrorMessage="Please enter email"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        <br />

                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ControlToValidate="TextBox3"
                            ErrorMessage="Enter Valid Email"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ForeColor="Red">
                        </asp:RegularExpressionValidator>

                    </td>

                </tr>


                <!-- Contact Number -->
                <tr>

                    <td>
                        <asp:Label
                            ID="contact"
                            runat="server"
                            Text="Contact Number">
                        </asp:Label>
                    </td>

                    <td>
                        <asp:TextBox
                            ID="TextBox5"
                            runat="server"
                            MaxLength="10">
                        </asp:TextBox>
                    </td>

                    <td>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
                            runat="server"
                            ControlToValidate="TextBox5"
                            ErrorMessage="Enter contact number"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        <br />

                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            runat="server"
                            ErrorMessage="Enter only 10 digit number"
                            ControlToValidate="TextBox5"
                            ValidationExpression="^[0-9]{10}$"
                            ForeColor="Red">
                        </asp:RegularExpressionValidator>

                    </td>

                </tr>


                <!-- Age -->
                <tr>

                    <td>
                        <asp:Label
                            ID="age"
                            runat="server"
                            Text="Age">
                        </asp:Label>
                    </td>

                    <td>
                        <asp:TextBox
                            ID="TextBox4"
                            runat="server">
                        </asp:TextBox>
                    </td>

                    <td>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="TextBox4"
                            ErrorMessage="Enter age"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        <br />

                        <asp:RangeValidator
                            ID="RangeValidator1"
                            runat="server"
                            ControlToValidate="TextBox4"
                            MinimumValue="18"
                            MaximumValue="60"
                            Type="Integer"
                            ErrorMessage="Age must be between 18 and 60"
                            ForeColor="Red">
                        </asp:RangeValidator>

                    </td>

                </tr>


                <!-- Gender -->
                <tr>

                    <td>
                        <asp:Label
                            ID="gender"
                            runat="server"
                            Text="Gender">
                        </asp:Label>
                    </td>

                    <td>

                        <asp:RadioButton
                            ID="Male"
                            runat="server"
                            Text="Male"
                            GroupName="Gender" />

                        <br />

                        <asp:RadioButton
                            ID="Female"
                            runat="server"
                            Text="Female"
                            GroupName="Gender" />

                    </td>

                    <td>

                        <asp:CustomValidator
                            ID="CustomValidator1"
                            runat="server"
                            ErrorMessage="Please select gender"
                            ForeColor="Red"
                            ClientValidationFunction="ValidateGender"
                            OnServerValidate="CustomValidator1_ServerValidate">
                        </asp:CustomValidator>

                    </td>

                </tr>


                <!-- Event Type -->
                <tr>

                    <td>
                        <asp:Label
                            ID="event"
                            runat="server"
                            Text="Select Event Type">
                        </asp:Label>
                    </td>

                    <td>

                        <asp:CheckBox
                            ID="Paper"
                            runat="server"
                            Text="Paper Presentation" />

                        <br />

                        <asp:CheckBox
                            ID="Poster"
                            runat="server"
                            Text="Poster Presentation" />

                        <br />

                        <asp:CheckBox
                            ID="Coding"
                            runat="server"
                            Text="Coding Competition" />

                    </td>

                    <td>

                        <asp:CustomValidator
                            ID="CustomValidator2"
                            runat="server"
                            ErrorMessage="Please select at least one event"
                            ForeColor="Red"
                            ClientValidationFunction="ValidateEvent"
                            OnServerValidate="CustomValidator2_ServerValidate">
                        </asp:CustomValidator>

                    </td>

                </tr>


                <!-- Calendar -->
                <tr>

                    <td>
                        <asp:Label
                            ID="date"
                            runat="server"
                            Text="Select Date">
                        </asp:Label>
                    </td>

                    <td>
                        <asp:Calendar
                            ID="Calendar1"
                            runat="server">
                        </asp:Calendar>
                    </td>

                </tr>


                <!-- Buttons -->
                <tr>

                    <td colspan="2">

                        <asp:Button
                            ID="Button1"
                            runat="server"
                            Text="Register"
                            OnClick="Button1_Click" />

                        &nbsp;&nbsp;

                        <asp:Button
                            ID="Button2"
                            runat="server"
                            Text="Clear"
                            CausesValidation="False"
                            OnClick="Button2_Click" />

                    </td>

                </tr>

            </table>

        </center>

    </form>

</body>

</html>