FROM gitpod/workspace-base

# Install lua
RUN curl -R -O http://www.lua.org/ftp/lua-5.4.3.tar.gz
RUN tar zxf lua-5.4.3.tar.gz
RUN cd lua-5.4.3 && make
RUN cd lua-5.4.3 && make test
RUN cd lua-5.4.3 && sudo make install

# Install lua rock
RUN wget https://luarocks.org/releases/luarocks-3.3.1.tar.gz
RUN tar zxpf luarocks-3.3.1.tar.gz
RUN cd luarocks-3.3.1 && ./configure --with-lua-include=/usr/local/include
RUN cd luarocks-3.3.1 && make
RUN cd luarocks-3.3.1 && sudo make install

# Cleanup
RUN rm -r lua-5.4.3.tar.gz
RUN rm -r lua-5.4.3
RUN rm -r luarocks-3.3.1.tar.gz
RUN rm -r luarocks-3.3.1

# Define path
RUN echo export PATH="/usr/local/bin:$PATH" > $HOME/.bashrc.d/setenv.sh
RUN chmod +x $HOME/.bashrc.d/setenv.sh
