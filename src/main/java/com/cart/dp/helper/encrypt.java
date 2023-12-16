
package com.cart.dp.helper;
//password encryption
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class encrypt 
{
    public static String encrypt_password(String pass)throws NoSuchAlgorithmException
    {
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] passwordBytes = pass.getBytes();
                byte[] hashedBytes = md.digest(passwordBytes);
                StringBuilder hexStringBuilder = new StringBuilder();
                for (byte b : hashedBytes) 
                        {
                    hexStringBuilder.append(String.format("%02x", b));
                }
                return hexStringBuilder.toString();
    }
}
