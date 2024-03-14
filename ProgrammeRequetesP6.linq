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

void FiltrerTickets(int? statut=null, DateTime? dateMin=null, DateTime? dateMax=null, int? idProduit=null, string version=null, List<string> MotsCles=null)
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
	FiltrerTickets(statut:1);
	FiltrerTickets(statut:1, idProduit:1);
	FiltrerTickets(statut:1, idProduit:1, version :"1.1");
	FiltrerTickets(idProduit:1, dateMin:new DateTime(2024, 1, 1),dateMax:new DateTime(2024, 3, 1));
	FiltrerTickets(idProduit:1, dateMin:new DateTime(2024, 1, 1),dateMax:new DateTime(2024, 3, 1), version :"1.1");
	FiltrerTickets(statut:1, MotsCles:new List<string>{"ne","pas"});
	FiltrerTickets(statut:1, MotsCles:new List<string>{"ne","pas"}, idProduit:1);
	FiltrerTickets(statut:1, MotsCles:new List<string>{"ne","pas"}, idProduit:1, version :"1.1");
	FiltrerTickets(idProduit:1, dateMin:new DateTime(2024, 1, 1),dateMax:new DateTime(2024, 3, 1), MotsCles:new List<string>{"ne","pas"});
	FiltrerTickets(idProduit:1, dateMin:new DateTime(2024, 1, 1),dateMax:new DateTime(2024, 3, 1), MotsCles:new List<string>{"ne","pas"}, version :"1.1");
	FiltrerTickets(statut:2);
	FiltrerTickets(statut:2, idProduit:1);
	FiltrerTickets(statut:2, idProduit:1, version :"1.1");
	FiltrerTickets(statut:2, idProduit:1, dateMin:new DateTime(2024, 1, 1),dateMax:new DateTime(2024, 3, 1));
	FiltrerTickets(statut:2, idProduit:1, dateMin:new DateTime(2024, 1, 1),dateMax:new DateTime(2024, 3, 1), version :"1.1");
	FiltrerTickets(statut:2, MotsCles:new List<string>{"ne","pas"});
	FiltrerTickets(statut:2, MotsCles:new List<string>{"ne","pas"}, idProduit:1);
	FiltrerTickets(statut:2, MotsCles:new List<string>{"ne","pas"}, idProduit:1, version :"1.1");
	FiltrerTickets(statut:2, idProduit:1, dateMin:new DateTime(2024, 1, 1),dateMax:new DateTime(2024, 3, 1), MotsCles:new List<string>{"ne","pas"});
	FiltrerTickets(statut:2, idProduit:1, dateMin:new DateTime(2024, 1, 1),dateMax:new DateTime(2024, 3, 1), MotsCles:new List<string>{"ne","pas"}, version :"1.1");
}
