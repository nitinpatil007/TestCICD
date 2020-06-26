public class ParkLocator {
public static List<String> Country(String cname) {
        ParkService.ParksImplPort park = 
            new ParkService.ParksImplPort();
        return park.byCountry(cname);
    }
}