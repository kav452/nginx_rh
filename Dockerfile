FROM debian:buster                                                                                                                                                                                                                   
                                                                                                                                                                                                                                     
ENV  DEBIAN_FRONTEND noninteractive                                                                                                                                                                                                  
                                                                                                                                                                                                                                     
RUN  apt update -q && \                                                                                                                                                                                                              
     apt install -yq --no-install-recommends --no-install-suggests \                                                                                                                                                                 
         apt-transport-https ca-certificates openssl && \                                                                                                                                                                            
     rm -rf /var/lib/apt/lists/*                                                                                                                                                                                                     
                                                                                                                                                                                                                                     
ADD  qtunnel_server /tmp/qtunnel_server                                                                                                                                                                                              
                                                                                                                                                                                                                                     
RUN cd /tmp/qtunnel_server/ && ./install_qtunnel_server.sh                                                                                                                                                                           
                                                                                                                                                                                                                                     
RUN rm /tmp/* -fr                                                                                                                                                                                                                    
                                                                                                                                                                                                                                     
EXPOSE  1081/tcp                                                                                                                                                                                                                     
                                                                                                                                                                                                                                     
CMD     LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/stunnel /usr/local/etc/qtunnel/server.conf
