<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="web_app.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title text-center">Register</h5>
                    </div>
                    <div class="card-body">
                        <form id="registrationForm">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="lastname" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="lastname" name="lastname" required>
                            </div>

                            <div class="mb-3">
                                <label for="phonenumber" class="form-label">Phone Number</label>
                                <input type="text" class="form-control" id="phonenumber" name="phonenumber" required>
                            </div>
                            

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                         
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                           
                            <div class="mb-3">
                                <label for="gender" class="form-label">Gender</label>
                                <select class="form-select" id="gender" name="gender" required>
                                    <option value="" selected disabled>Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="usertype" class="form-label">User Type</label>
                                <select class="form-select" id="usertype" name="usertype" required>
                                    <option value="" selected disabled>Select User Type</option>
                                    <option value="Passenger">Passenger</option>
                                    <option value="Driver">Driver</option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="submissionMessage" class="text-center mt-3" style="display: none;">
        <p>Register in was unsuccessfully. Please enter valid details</p>
    </div>

<script>
    document.getElementById('registrationForm').addEventListener('submit', async (event) => {
        event.preventDefault(); 

        const formData = new FormData(event.target);

        const jsonObject = {}; 
        formData.forEach((value, key) => {
            jsonObject[key] = value; 
        });

        try {
            const response = await fetch('http://localhost:3000/registration', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(jsonObject) 
            });

            const data = await response.json(); 
            console.log('Response from server:', data);

            if (data.status === true) {
                // Redirect to another page
                window.location.href = '/login.html'; 
            } else {
               
                document.getElementById('submissionMessage').style.display = 'block';
            }

        } catch (error) {
            console.error('Error:', error);
        }
    });
</script>
</asp:Content>
