import com.meterware.httpunit.*;

//This example reads the example1.jsp from web server 
//and displays its title and content.
public class Example {


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
  System.out.println("Title is :" + response.getTitle() );
  //Display the content of the page
  System.out.println("Page content is :" + response.getText() );

  WebForm loginForm = response.getForms()[0];
  request = loginForm.getRequest();
  request.setParameter( "username", "b" );
  request.setParameter( "password", "b" );
  response = wc.getResponse( request );
  System.out.println("Title is :" + response.getTitle() );
  System.out.println("Page content is :" + response.getText() );

  loginForm = response.getForms()[0];
  request = loginForm.getRequest();
  response = wc.getResponse( request );

  System.out.println("Title is :" + response.getTitle() );
  System.out.println("Page content is :" + response.getText() );

  loginForm = response.getForms()[1];
  request = loginForm.getRequest();
  response = wc.getResponse( request );

  System.out.println("Title is :" + response.getTitle() );
  System.out.println("Page content is :" + response.getText() );
  String text = response.getText();

  if (text.contains("Mar 14, 2018 8:06:04 PM"))
	System.out.println("Found");


  } catch (Exception e) {
  System.err.println( "Exception: " + e );
  }
 }
}


