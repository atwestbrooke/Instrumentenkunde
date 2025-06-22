export default async (request, context) => {
  const auth = request.headers.get("authorization");

  const expected = "Basic " + btoa("Student:organology25");

  if (auth === expected) {
    return context.next();
  }

  return new Response("Unauthorized", {
    status: 401,
    headers: {
      "WWW-Authenticate": 'Basic realm="Secure Area"',
    },
  });
};
