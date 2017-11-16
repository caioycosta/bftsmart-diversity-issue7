package bftsmart.diversity.demos.kv;
import bftbench.RequestOuterClass.Request;
import bftbench.ResponseOuterClass.Response;
import bftsmart.tom.ServiceProxy;
import java.io.*;
import com.google.protobuf.InvalidProtocolBufferException;


public class KVClientProto {
public static void main(String[] args) throws IOException {

	if (args.length < 1) {
		System.out.println("Usage: ... ListClient <process id>");
		System.exit(-1);
}

int id = Integer.parseInt(args[0]);

ServiceProxy proxy;
proxy = new ServiceProxy(id);
InputStreamReader converter = new InputStreamReader(System.in);
BufferedReader in = new BufferedReader(converter);
String lido;
do {
System.out.println("digite operacao ( get, put, delete, list ):");
lido = in.readLine();

string chave = "";
string valor = "";
if (lido == "get" || lido == "put" || lido == "delete") {
System.out.println("digite o chave:");
lido = in.readLine();
chave = lido;
System.out.println("digite o valor:");
lido = in.readLine();
valor = lido;
}

switch (lido)
{
case "put":
Request.Builder reqst;
reqst = Request.newBuilder();

reqst.setAction(Request.RequestType.PUT);
reqst.setKey(chave);
reqst.setValue(valor);

byte[] msg = reqst.build().toByteArray();
System.out.println("--");
//System.out.println(msg.length);


byte[] rsp = proxy.invokeOrdered(msg);
Response resp = Response.parseFrom(rsp);
System.out.println(resp.getBoolResponse().toString());

//byte[] rsp2 = proxy.invokeUnordered(msg);
//bftbench.VazioOuterClass.Vazio.parseFrom(rsp2);
//System.out.println(rsp2.length);
  break;
case "get":
Request.Builder reqst;
reqst = Request.newBuilder();

reqst.setAction(Request.RequestType.GET);
reqst.setKey(chave);

byte[] msg = reqst.build().toByteArray();
System.out.println("--");
//System.out.println(msg.length);


byte[] rsp = proxy.invokeOrdered(msg);
Response resp = Response.parseFrom(rsp);
System.out.println(resp.getBoolResponse().toString());
if (resp.getBoolResponse()) {
System.out.println(resp.getStringResponse());
}

  break;
case "delete":
Request.Builder reqst;
reqst = Request.newBuilder();

reqst.setAction(Request.RequestType.DELETE);
reqst.setKey(chave);

byte[] msg = reqst.build().toByteArray();
System.out.println("--");
//System.out.println(msg.length);


byte[] rsp = proxy.invokeOrdered(msg);
Response resp = Response.parseFrom(rsp);
System.out.println(resp.getBoolResponse().toString());

  break;
case "list":
Request.Builder reqst;
reqst = Request.newBuilder();

reqst.setAction(Request.RequestType.LIST);


byte[] msg = reqst.build().toByteArray();
System.out.println("--");
//System.out.println(msg.length);


byte[] rsp = proxy.invokeOrdered(msg);
Response resp = Response.parseFrom(rsp);
for (String str : resp.getListResponseList())
{
System.out.println(str);
}
  break;
default: 
  break;
}

} while (true);

proxy.close();

}

}
