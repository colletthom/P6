<Query Kind="Program">
  <Connection>
    <ID>53887b57-05b1-4fac-882a-0ad176795d1e</ID>
    <NamingServiceVersion>2</NamingServiceVersion>
    <Persist>true</Persist>
    <Driver Assembly="(internal)" PublicKeyToken="no-strong-name">LINQPad.Drivers.EFCore.DynamicDriver</Driver>
    <AllowDateOnlyTimeOnly>true</AllowDateOnlyTimeOnly>
    <Server>.</Server>
    <Database>P6NexaWorks</Database>
    <DriverData>
      <EncryptSqlTraffic>True</EncryptSqlTraffic>
      <PreserveNumeric1>True</PreserveNumeric1>
      <EFProvider>Microsoft.EntityFrameworkCore.SqlServer</EFProvider>
    </DriverData>
  </Connection>
</Query>

void FiltrerTickets(int? statut, DateTime? dateMin, DateTime? dateMax, int? idProduit, string version, List<string> MotsCles)
{
	IQueryable<Ticket> ListeProblemes = Tickets;
	if (statut != null)
    {
		ListeProblemes = ListeProblemes
	        .Where(t => t.Statut == statut);
	}
	
	if (dateMin!= null && dateMax != null)
	{
		ListeProblemes = ListeProblemes
		        .Where(t=>t.IdProduitSysteme_exploitationProduitSystemeexploitation.IdProduit == idProduit && t.DateCreation > dateMin && t.DateCreation < dateMax);
	}
	
	if (version != null && idProduit != null )
    {
        ListeProblemes = ListeProblemes.Where(t => t.IdProduitSysteme_exploitationProduitSystemeexploitation.IdProduit == idProduit && t.IdProduitSysteme_exploitationProduitSystemeexploitation.Version == version);
    }
	else if (idProduit != null)
	{
		ListeProblemes = ListeProblemes
		        .Where(t=>t.IdProduitSysteme_exploitationProduitSystemeexploitation.IdProduit == idProduit);
	}

    if (MotsCles != null)
    {
        foreach (string mot in MotsCles)
        {
            ListeProblemes = ListeProblemes.Where(t => t.Probleme.Contains(mot));
        }
    }

    var result = ListeProblemes
        .Select(p => new
        {
            p.Probleme,
            p.Statut,
            p.DateCreation,
            p.Resolution,
            p.DateResolution,
            p.IdProduitSysteme_exploitationProduitSystemeexploitation.IdProduit,
            p.IdProduitSysteme_exploitationProduitSystemeexploitation.IdSystemeexploitation,
            p.IdProduitSysteme_exploitationProduitSystemeexploitation.Version
        });

    result.Dump();
}

void Main()
{
	//int? statut = 1;
	int? statut = 2;
	//int? statut = null;
	
    //DateTime? dateMin = new DateTime(2024, 1, 1);
    //DateTime? dateMax = new DateTime(2024, 3, 1);
	DateTime? dateMin = null;
	DateTime? dateMax = null;
	
	int? idProduit = 1;
	//int? idProduit = null;
	
    string version = "1.2";
    //string version = null;

    List <string> MotsCles= new List<String> {"notifications","ne","pas"};
    //List<string> MotsCles = null;

    FiltrerTickets(statut, dateMin, dateMax, idProduit, version, MotsCles);
}
