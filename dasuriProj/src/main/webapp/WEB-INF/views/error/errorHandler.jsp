<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="error">
            <div class="error__content">
              <h2>${error}</h2>
              <h3>Something went wrong!</h3>
              <p>There was a problem on our end. Please try again later.</p>
              <button type="button" class="btn btn-accent btn-pill"
              	onclick="/cus/list">← Go Back</button>
            </div>
            <!-- / .error_content -->
          </div>