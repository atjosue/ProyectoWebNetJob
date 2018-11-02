
<%
    if(request.getParameter("n1")!=null && request.getParameter("n2")!=null)
    {
        int n1=Integer.parseInt(request.getParameter("n1"));
        int n2=Integer.parseInt(request.getParameter("n2"));
        
        int suma=n1+n2;
        
        out.print("<center><h1>"+suma+"</h1></center>");
    }
%>