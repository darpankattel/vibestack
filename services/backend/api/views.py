from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status


class HealthCheckView(APIView):
    def get(self, request):
        """Health check endpoint"""
        return Response(
            data={
                'service': 'backend',
                'status': 'running',
                'message': 'Backend service is operational'
            },
            status=status.HTTP_200_OK,
        )
