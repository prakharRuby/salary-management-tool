import { useEffect, useState } from "react";
import api from "./services/api";
import DashboardCards from "./components/DashboardCards";
import EmployeeTable from "./components/EmployeeTable";
import EmployeeForm from "./components/EmployeeForm";

function App() {
  const [employees, setEmployees] = useState([]);
  const [filtered, setFiltered] = useState([]);
  const [insights, setInsights] = useState({});
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const rowsPerPage = 10;
  const [country, setCountry] = useState("");
  const [jobTitle, setJobTitle] = useState("");

  const [open, setOpen] = useState(false);
  const [selectedEmployee, setSelectedEmployee] = useState(null);

  const loadData = async () => {
    const empRes = await api.get("/employees");
    const insightRes = await api.get("/insights", {
      params: {
        country,
        job_title: jobTitle
      }
    });

    setEmployees(empRes.data);
    setFiltered(empRes.data);
    setInsights(insightRes.data);
  };

  useEffect(() => {
  loadData();
}, [country, jobTitle]);

  useEffect(() => {
    const result = employees.filter((emp) =>
      emp.full_name.toLowerCase().includes(search.toLowerCase())
    );
    setFiltered(result);
  }, [search, employees]);

  const openAdd = () => {
    setSelectedEmployee(null);
    setOpen(true);
  };

  const openEdit = (emp) => {
    setSelectedEmployee(emp);
    setOpen(true);
  };

const indexOfLast = currentPage * rowsPerPage;
const indexOfFirst = indexOfLast - rowsPerPage;
const currentEmployees = filtered.slice(indexOfFirst, indexOfLast);

const totalPages = Math.ceil(filtered.length / rowsPerPage);

  return (
    <div style={{ padding: "20px" }}>
      <h1>Salary Management Dashboard</h1>

      <DashboardCards insights={insights} />

      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          marginBottom: "20px"
        }}
      >
        <input
          placeholder="Search employee..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
        <select
  value={country}
  onChange={(e) => setCountry(e.target.value)}
>
  <option value="">All Countries</option>
  <option value="India">India</option>
  <option value="USA">USA</option>
  <option value="UK">UK</option>
  <option value="Canada">Canada</option>
</select>

<select
  value={jobTitle}
  onChange={(e) => setJobTitle(e.target.value)}
>
  <option value="">All Job Titles</option>
  <option value="Engineer">Engineer</option>
  <option value="Manager">Manager</option>
  <option value="HR">HR</option>
  <option value="Designer">Designer</option>
</select>

        <button onClick={openAdd}>+ Add Employee</button>
      </div>

      <EmployeeTable
        employees={currentEmployees}
        refresh={loadData}
        onEdit={openEdit}
      />
      <div style={{ marginTop: "20px", display: "flex", gap: "8px" }}>
        <button
          disabled={currentPage === 1}
          onClick={() => setCurrentPage(currentPage - 1)}
        >
          Prev
        </button>

        <span>Page {currentPage} of {totalPages}</span>

        <button
          disabled={currentPage === totalPages}
          onClick={() => setCurrentPage(currentPage + 1)}
        >
          Next
        </button>
      </div>
      <EmployeeForm
        refresh={loadData}
        employee={selectedEmployee}
        open={open}
        setOpen={setOpen}
      />
    </div>
  );
}

export default App;