public class TrailLoop {
   
 
    
    //Here is a combined problem of a query that needs a filter
    //and a loop that continually calls out to the database
    public static void AllGoodThings(Account a) {
        List<Task> allMyTasks = [Select Id, status, whatId From Task where whatId=: a.id];
        List<Task> updatetasks = new List<Task>();
        for (Task t : allMyTasks) {
            
                t.status = 'Completed';
                updatetasks.add(t);
           
        }
        update updatetasks;
    }
    
   
    
}