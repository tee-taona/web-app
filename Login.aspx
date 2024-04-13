<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="web_app.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title text-center">Log In</h5>
                    </div>
                    <div class="card-body">
                        <form id="LoginForm">
                           
                            <div class="mb-3">
                                <label for="email" class="form-label">Username</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="e.g example@gmail.com" required>
                            </div>
                         
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
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
                                <button type="submit" class="btn btn-primary">Log In</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="submissionMessage" class="text-center mt-3" style="display: none;">
        <p>Log in was  unsuccessfully! Please enter valid details</p>
    </div>

    <script>
        document.getElementById('LoginForm').addEventListener('submit', async (event) => {
            event.preventDefault(); // Prevent default form submission
    
            const formData = new FormData(event.target); // Get form data
    
            const jsonObject = {}; // Create an object to hold form data
            formData.forEach((value, key) => {
                jsonObject[key] = value; // Populate the object with form data
            });
    
            try {
                const response = await fetch('http://localhost:3000/login', { // Replace with your backend URL
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(jsonObject) // Convert object to JSON string
                });
    
                const data = await response.json(); // Read the response body as JSON
                console.log('Response from server:', data);
    
          if (data.status === true) {
                // Redirect to another page
                window.location.href = '/Home.aspx'; // Replace '/dashboard' with the URL of your dashboard page
            } else {
                // Display submission message
                document.getElementById('submissionMessage').style.display = 'block';
            }
                
           
            } catch (error) {
                console.error('Error:', error);
            }
        });
    </script>
</asp:Content>
