package com.dbprocess;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.DefaultSerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;

public class ObjectMapperWrapper {
	private static ObjectMapper om = new ObjectMapper();

	static {

		try {
			DefaultSerializerProvider.Impl sp = new DefaultSerializerProvider.Impl();
			sp.setNullValueSerializer(new NullSerializer());

			SimpleModule simpleModule = new SimpleModule();
			simpleModule.addSerializer(String.class, new NewLineRemovalSerializer());

			om.registerModule(simpleModule);
			om.setSerializerProvider(sp);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

	}

	public static ObjectMapper getObjectMapper() {
		return om;
	}
}

class NullSerializer extends JsonSerializer<Object> {
	public void serialize(Object value, JsonGenerator jgen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		jgen.writeString("");
	}
}

@SuppressWarnings("serial")
class NewLineRemovalSerializer extends StdSerializer<String> {
	public NewLineRemovalSerializer() {
		this(null);
	}

	public NewLineRemovalSerializer(Class<String> t) {
		super(t);
	}

	public void serialize(String value, JsonGenerator jgen, SerializerProvider provider)
			throws IOException, JsonProcessingException {	
		/*if(value != null){
			System.out.println("z "+value.contains("\n"));
		}*/
				
		if(value != null && value.contains("\n")){	
			//System.out.println("z "+value);
			jgen.writeString(value.replace("\n", ""));
		}else{
			jgen.writeString(value);
		}
		
	}
}