import http from 'k6/http';

export const options = {
  // run 40 requests in parallel
  vus: 40,
  iterations: 40,
  noConnectionReuse: true,
};

export default function () {
  http.get("http://frontend:3000/grots");
}
