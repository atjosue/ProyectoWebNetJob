
package com.recursos;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * Nombre de la clase: Encritacion
 * Fecha: 03/02/2018
 * Version 1.0
 * copyRight 
 * @author Carlos Campos
 */
public class Encriptacion {
    
    
    //ENCRIPTACION EN SHA1
     public  String SHA1(String input)
        {
            try
            {
             MessageDigest mDigest= MessageDigest.getInstance("SHA1");
            byte[] result=mDigest.digest(input.getBytes());
            StringBuffer sb=new StringBuffer();
            for (int i = 0; i < result.length; i++) {
                sb.append(Integer.toString((result[i] & 0xff)+0x100,16).substring(1));
            }
            return sb.toString();
            } 
            catch (Exception e)
            {
                throw new RuntimeException(e);
            }
            
        
            
}
     
     //ENCRIPTACION EN MD5
     public static String MD5(String input)
     {
         try 
         {
             MessageDigest md= MessageDigest.getInstance("MD5");
             byte[] messageDigest= md.digest(input.getBytes());
             BigInteger number= new BigInteger(1, messageDigest);
             String hashtext= number.toString(16);
             while(hashtext.length()<32)
             {
                 hashtext = "0" + hashtext;
             }
             return hashtext;
         }
         catch (Exception e) 
         {
             throw new RuntimeException(e);
         }
     
     }
    
    
}
