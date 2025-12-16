function x=myeof(a,N,id)
if exist('id')
  [EOF,EOF_TS,expvar] = eof(a,N,'mask',id);
else
  [EOF,EOF_TS,expvar] = eof(a,N);
end
EOF_TS=EOF_TS';

x.data      =a;
x.EOF       =EOF;
x.EOF_TS    =EOF_TS;
x.EOF_TS_std=std(EOF_TS,[],1);
x.expvar    =expvar;

a=x.EOF_TS_std;
for i=1:N
  x.eof(:,:,i) =EOF (:,:,i)*a(i); 
  x.eof_ts(:,i)=EOF_TS(:,i)/a(i); 
  x.expvar(i)  =expvar(i);
end

x.index1=squeeze(x.eof_ts(:,1));
x.index2=squeeze(x.eof_ts(:,2));

nt=length(x.EOF_TS(:,1));
for t=1:nt
  i=1;t
  a=x.EOF(:,:,i)*x.EOF_TS(t,i);
  for i=2:N
    a=a+x.EOF(:,:,i)*x.EOF_TS(t,i);
  end
  x.data_recon(:,:,t)=a;
end
