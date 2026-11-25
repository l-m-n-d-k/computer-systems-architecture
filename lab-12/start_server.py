from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler
import os
import webbrowser

HOST = 'localhost'
PORT = 8000

if __name__ == '__main__':
   os.chdir(os.path.dirname(os.path.abspath(__file__)))
   url = f'http://{HOST}:{PORT}'
   print(f'Serving at {url}')
   try:
      webbrowser.open(url)
   except Exception:
      pass
   server = ThreadingHTTPServer((HOST, PORT), SimpleHTTPRequestHandler)
   server.serve_forever()
