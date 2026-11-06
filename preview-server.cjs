const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(process.argv[2] || __dirname);
const port = Number(process.argv[3] || 52678);
const file = path.join(root, 'github-development-workflow-howto.html');

const server = http.createServer((request, response) => {
  const pathname = new URL(request.url, `http://127.0.0.1:${port}`).pathname;
  if (request.method === 'POST' && pathname === '/__stop') {
    response.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' });
    response.end('Preview server stopped.');
    server.close();
    return;
  }
  if (request.method !== 'GET' || !fs.existsSync(file)) {
    response.writeHead(404);
    response.end('Not found');
    return;
  }
  if (pathname === '/narrow') {
    response.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' });
    response.end('<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Narrow layout preview</title><body style="margin:0;padding:1rem;background:#ddd"><iframe title="Guide at 375 pixel width" src="/" style="display:block;width:375px;height:850px;border:1px solid #999;background:white"></iframe></body></html>');
    return;
  }
  response.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' });
  fs.createReadStream(file).pipe(response);
});

server.listen(port, '127.0.0.1', () => {
  process.stdout.write(`Git guide preview: http://localhost:${port}/\n`);
});
