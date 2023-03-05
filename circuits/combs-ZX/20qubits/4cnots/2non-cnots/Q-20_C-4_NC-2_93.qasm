OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[4];
x q[15];
z q[12];
cx q[14], q[4];
cx q[11], q[10];
cx q[17], q[13];
