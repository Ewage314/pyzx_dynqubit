OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[7];
cx q[4], q[0];
z q[18];
x q[2];
cx q[11], q[13];
cx q[4], q[15];
