function [dta]=read_packet(filename)
   dta=[];
   f=fopen(filename,'r','l');
   d=fread(f,'float32');
   d=transpose(reshape(d,2,size(d,1)/2));
   d=complex(d(:,1),d(:,2));  
   dta=[dta,d];
   fclose(f);
end
