OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[3];
cx q[4], q[0];
cx q[18], q[19];
x q[1];
cx q[11], q[14];
