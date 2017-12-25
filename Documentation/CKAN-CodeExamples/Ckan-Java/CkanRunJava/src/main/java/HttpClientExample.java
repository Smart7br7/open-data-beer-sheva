
import java.io.*;
import java.net.*;
import java.util.Map;
import com.google.gson.Gson;


public class HttpClientExample {

    public static String getHTML(String urlToRead) throws Exception {
        StringBuilder result = new StringBuilder();
        URL url = new URL(urlToRead);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        String line;
        while ((line = rd.readLine()) != null) {
            result.append(line);
        }
        rd.close();
        return result.toString();
    }

    public static void main(String[] args) throws Exception
    {

        String json = new String();


        json = getHTML("http://opendata.br7.org.il/api/3/action/package_show?id=fountains");

        // the text is printed in unicode, it's  a known bug: https://youtrack.jetbrains.com/issue/IDEA-115049
        System.out.println(json);


    }
}