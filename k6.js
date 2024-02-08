// Loadtesting script using k6.io

import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '1m', target: 600 },
    { duration: '10m', target: 1000 },
    { duration: '1m', target: 0 },
  ],
};

export default function () {
  const res = http.get('https://nodeapp.YOUR_DOMAIN.com');
  check(res, { 'status was 200': (r) => r.status == 200 });
  sleep(1);
}