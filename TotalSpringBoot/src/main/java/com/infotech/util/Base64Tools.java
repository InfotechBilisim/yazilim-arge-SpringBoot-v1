/**
 * 
 */
package com.infotech.util;

/**
 * @author eTaskin
 *
 * 19 Haz 2020
 * 
 * Not: EkipMobil uygulamasından alınmıştır.
 * 
 */
import java.io.File;
import java.io.FileInputStream;

public class Base64Tools {
    private static char[] map1 = new char[64];
    private static byte[] map2;
    
    static
    {
      int i = 0;
      for (char c = 'A'; c <= 'Z'; c = (char)(c + '\001')) {
        map1[(i++)] = c;
      }
      for (char c = 'a'; c <= 'z'; c = (char)(c + '\001')) {
        map1[(i++)] = c;
      }
      for (char c = '0'; c <= '9'; c = (char)(c + '\001')) {
        map1[(i++)] = c;
      }
      map1[(i++)] = '+';map1[(i++)] = '/';
      
      map2 = new byte['?'];
      for (int k = 0; i < map2.length; k++) {
        map2[k] = -1;
      }
      for (int j = 0; i < 64; j++) {
        map2[map1[j]] = ((byte)j);
      }
    }
    
    public static String encodeFile(String fname, int reclen)
    {
      FileInputStream inp = null;
      StringBuffer str = new StringBuffer("");
      try
      {
        File f = new File(fname);
        int length = (int)f.length();
        if (reclen <= 0) {
          reclen = length;
        }
        byte[] bytes = new byte[length + 1024];
        inp = new FileInputStream(f);
        length = inp.read(bytes);
        int offs = 0;
        char[] chars;
        while (offs < length)
        {
          if (offs + reclen > length) {
            reclen = length - offs;
          }
          chars = encode(bytes, offs, reclen);
          str.append(chars);
          str.append('\n');
          offs += reclen;
        }
        return str.toString();
      }
      catch (Exception ex)
      {
        ex.printStackTrace();
      }
      finally
      {
        try
        {
          if (inp != null) {
            inp.close();
          }
        }
        catch (Exception localException3) {}
      }
      return null;
    }
    
    public static String encodeString(String s)
    {
      return new String(encode(s.getBytes()));
    }
    
    public static char[] encode(byte[] bytes)
    {
      return encode(bytes, 0, bytes.length);
    }
    
    public static char[] encode(byte[] in, int offs, int iLen)
    {
      int oDataLen = (iLen * 4 + 2) / 3;
      int oLen = (iLen + 2) / 3 * 4;
      char[] out = new char[oLen];
      int ip = 0;
      for (int op = 0; ip < iLen; op++)
      {
        int i0 = in[(offs + ip++)] & 0xFF;
        int i1 = ip < iLen ? in[(offs + ip++)] & 0xFF : 0;
        int i2 = ip < iLen ? in[(offs + ip++)] & 0xFF : 0;
        int o0 = i0 >>> 2;
        int o1 = (i0 & 0x3) << 4 | i1 >>> 4;
        int o2 = (i1 & 0xF) << 2 | i2 >>> 6;
        int o3 = i2 & 0x3F;
        out[(op++)] = map1[o0];
        out[(op++)] = map1[o1];
        out[op] = (op < oDataLen ? map1[o2] : '=');op++;
        out[op] = (op < oDataLen ? map1[o3] : '=');
      }
      return out;
    }
    
    public static String decodeString(String s)
    {
      return new String(decode(s));
    }
    
    public static byte[] decode(String s)
    {
      return decode(s.toCharArray());
    }
    
    public static byte[] decode(char[] in)
    {
      int iLen = in.length;
      if (iLen % 4 != 0) {
        throw new IllegalArgumentException("Length of Base64 encoded input string is not a multiple of 4.");
      }
      while ((iLen > 0) && (in[(iLen - 1)] == '=')) {
        iLen--;
      }
      int oLen = iLen * 3 / 4;
      byte[] out = new byte[oLen];
      int ip = 0;
      int op = 0;
      while (ip < iLen)
      {
        int i0 = in[(ip++)];
        int i1 = in[(ip++)];
        int i2 = ip < iLen ? in[(ip++)] : 65;
        int i3 = ip < iLen ? in[(ip++)] : 65;
        if ((i0 > 127) || (i1 > 127) || (i2 > 127) || (i3 > 127)) {
          throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
        }
        int b0 = map2[i0];
        int b1 = map2[i1];
        int b2 = map2[i2];
        int b3 = map2[i3];
        if ((b0 < 0) || (b1 < 0) || (b2 < 0) || (b3 < 0)) {
          throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
        }
        int o0 = b0 << 2 | b1 >>> 4;
        int o1 = (b1 & 0xF) << 4 | b2 >>> 2;
        int o2 = (b2 & 0x3) << 6 | b3;
        out[(op++)] = ((byte)o0);
        if (op < oLen) {
          out[(op++)] = ((byte)o1);
        }
        if (op < oLen) {
          out[(op++)] = ((byte)o2);
        }
      }
      return out;
    }
}
