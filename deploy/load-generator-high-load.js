import http from 'k6/http';
import {check} from "k6";

export const options = {
  // run 40 requests in parallel
  vus: 40,
  iterations: 40,
  noConnectionReuse: true,
};

export default function () {
    const response = http.get("http://frontend:3000/grots");
    check(response, {
        "is status 200": (r) => r.status === 200,
        "is not null": (r) => r.json() !== null,
        "name of first grot ends with Grot": (r) => response.json()[0].name.endsWith("Grot"),
    });
}
