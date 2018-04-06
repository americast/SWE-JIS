import com.meterware.httpunit.*;
import java.sql.*;  


//This example reads the example1.jsp from web server 
//and displays its title and content.
public class Example {

	void calendar()
	{

		try
		{
					WebConversation wc = new WebConversation();

					WebRequest request = new 
					GetMethodWebRequest( "http://localhost:8080/JIS/index.html" );
					WebResponse response = wc.getResponse( request );


					WebForm loginForm = response.getForms()[0];
					request = loginForm.getRequest();
					request.setParameter( "username", "d" );
					request.setParameter( "password", "d" );
					response = wc.getResponse( request );

					loginForm = response.getForms()[1];
					request = loginForm.getRequest();
					response = wc.getResponse( request );


					loginForm = response.getForms()[0];
					request = loginForm.getRequest();
					response = wc.getResponse( request );

					if (response.getText().contains("ID") && response.getText().contains("Defendant") && response.getText().contains("Crime"))
						System.out.println("#8 Calendar view passed");
					else
						System.out.println("#8 Calendar view failed");
				}
				catch (Exception e)
				{
								System.err.println( "Exception: " + e );

				}

	}

	void password()
	{

		try
		{
					WebConversation wc = new WebConversation();

					WebRequest request = new 
					GetMethodWebRequest( "http://localhost:8080/JIS/index.html" );
					WebResponse response = wc.getResponse( request );


					WebForm loginForm = response.getForms()[0];
					request = loginForm.getRequest();
					request.setParameter( "username", "d" );
					request.setParameter( "password", "d" );
					response = wc.getResponse( request );

					String text = response.getText();
					if (text.contains("judge"))
						System.out.println("#6 Judge login passed");
					else
						System.out.println("#6 Judge login failed");

					loginForm = response.getForms()[2];
					request = loginForm.getRequest();
					response = wc.getResponse( request );

					loginForm = response.getForms()[0];
					request = loginForm.getRequest();

					request.setParameter("oldpwd", "d" );
					request.setParameter("newpwd", "d" );
					response = wc.getResponse( request );

					if (response.getText().contains("Password changed."))
						System.out.println("#7 Password change passed");
					else
						System.out.println("#7 Password change failed");
				}
				catch (Exception e)
				{
								System.err.println( "Exception: " + e );

				}

	}


	void update()
	{

		try
		{
					WebConversation wc = new WebConversation();

					WebRequest request = new 
					GetMethodWebRequest( "http://localhost:8080/JIS/index.html" );
					WebResponse response = wc.getResponse( request );


					WebForm loginForm = response.getForms()[0];
					request = loginForm.getRequest();
					request.setParameter( "username", "r" );
					request.setParameter( "password", "r" );
					response = wc.getResponse( request );

					String text = response.getText();
					if (text.contains("registrar"))
						System.out.println("#4 Registrar login passed");
					else
						System.out.println("#4 Registrar login failed");

					loginForm = response.getForms()[0];
					request = loginForm.getRequest();
					response = wc.getResponse( request );

					loginForm = response.getForms()[1];
					request = loginForm.getRequest();
					response = wc.getResponse( request );

					loginForm = response.getForms()[response.getForms().length - 2];
					request = loginForm.getRequest();
					response = wc.getResponse( request );

					loginForm = response.getForms()[0];
					request = loginForm.getRequest();

					try
					{
						request.setParameter("day", "2" );
						request.setParameter("month", "2" );
						request.setParameter("year", "22" );
						request.setParameter("prosecutor", "Test" );
					}
					catch(Exception e)
					{
						request.setParameter( "details", "test" );					
					}
					response = wc.getResponse( request );

					if (response.getText().contains("Update successful."))
						System.out.println("#5 Update case passed");
					else
						System.out.println("#5 Update case failed");
				}
				catch (Exception e)
				{
								System.err.println( "Exception: " + e );

				}

	}


	public static void main(String args[]) {
		try {
  // create the conversation object 
  // to maintain state
			WebConversation wc = new WebConversation();

  // Obtain the example1.jsp
			WebRequest request = new 
			GetMethodWebRequest( "http://localhost:8080/JIS/index.html" );
			WebResponse response = wc.getResponse( request );

  //Display the title
			// System.out.println("Title is :" + response.getTitle() );
  //Display the content of the page
			// System.out.println("Page content is :" + response.getText() );

			WebForm loginForm = response.getForms()[0];
			request = loginForm.getRequest();
			request.setParameter( "username", "b" );
			request.setParameter( "password", "b" );
			response = wc.getResponse( request );
			// System.out.println("Title is :" + response.getTitle() );
			String text = response.getText();
			if (text.contains("lawyer"))
				System.out.println("#1 Lawyer login passed");
			else
				System.out.println("#1 Lawyer login failed");
			// System.out.println("Page content is :" + response.getText() );

			loginForm = response.getForms()[0];
			request = loginForm.getRequest();
			response = wc.getResponse( request );

			// System.out.println("Title is :" + response.getTitle() );
			// System.out.println("Page content is :" + response.getText() );

			loginForm = response.getForms()[1];
			request = loginForm.getRequest();
			response = wc.getResponse( request );

			// System.out.println("Title is :" + response.getTitle() );
			// System.out.println("Page content is :" + response.getText() );
			text = response.getText();

			Class.forName("com.mysql.jdbc.Driver");  
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?useSSL=false&" + "user=root&password=root");    
 
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery("Select * from cases;");  
			boolean flag = true;
			while(rs.next())  
			{
				try
				{
					String date = rs.getString("date");
					{
					if (!text.contains(date))
						flag = false;
						break;
					}
				}
				catch(Exception e)
				{
					System.out.print("");
				}
			}
			con.close();  

			if (flag)
				System.out.println("#2 Test Case passed");
			else
				System.out.println("#2 Test Case failed");

			loginForm = response.getForms()[response.getForms().length - 1];
			request = loginForm.getRequest();
			request.setParameter( "details", "test" );
			request.setParameter( "defendant", "test" );
			request.setParameter( "crime", "test" );
			response = wc.getResponse( request );

			text = response.getText();

			if (text.contains("New case creation successful."))
				System.out.println("#3 Test Creation passed");
			else
				System.out.println("#3 Test Creation failed");
			
			Example a = new Example();
			a.update();
			a.password();
			a.calendar();

			if (flag)
				System.out.println("#9 Database test passed");
			else
				System.out.println("#9 Database test failed");


		} catch (Exception e) {
			System.err.println( "Exception: " + e );
		}
	}
}


