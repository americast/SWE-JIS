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

  } catch (Exception e) {
  System.err.println( "Exception: " + e );
  }
 }
}


