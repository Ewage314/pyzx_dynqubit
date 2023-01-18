OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
cx q[3], q[7];
cx q[7], q[4];
