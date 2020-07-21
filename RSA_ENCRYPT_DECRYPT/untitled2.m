in=input("enter input message: \n");
p=input("Enter 1st prime number: \n");
q=input("Enter 2nd prime number: \n");
n=p*q
phi=(p-1)*(q-1)
for i=2:phi-1
  a=randi(phi);
  if(gcd(phi,a)==1)
  e=a
  break
end
end
i=1;
reminder=1;
while reminder > 0
  k=(phi*i)+1;
   reminder=rem(k,e);
    i=i+1;
end
d=k/e
fprintf("Private key = (%d,%d) \n",n,d);
fprintf("Public key = (%d,%d) \n",n,e);
m=uint64(in^e);
c=mod(m,n);
fprintf("Encrypted message: %d \n",c); 
m1=uint64(c^d);
dec=mod(m1,n);
fprintf("Decrypted message: %d \n",dec);